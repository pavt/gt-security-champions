Class {
	#name : #GtActionEcosystem,
	#superclass : #GtActionEntity,
	#instVars : [
		'repos'
	],
	#category : #'GtSecurityChampions-Model'
}

{ #category : #'instance-creation' }
GtActionEcosystem class >> fromGitHubUrls: urlList [
	| ecosystem |
	ecosystem := self new.
	urlList
		do: [ :url | 
			| json dict repo |
			json := ZnClient new get: url.
			dict := STONJSON fromString: json.
			repo := GtActionRepo new rawData: dict.
			ecosystem addRepo: repo ].
	^ ecosystem
]

{ #category : #managing }
GtActionEcosystem >> addRepo: aRepo [
	self repos add: aRepo
]

{ #category : #'as yet unclassified' }
GtActionEcosystem >> gtReposFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Actions repos';
		priority: 40;
		items: [ self repos ]
		"column: 'Repo' text: #name;
		column: 'Description' text: #description;
		column: 'Open issues' text: #numberOfOpenIssues;
		column: 'License' text: #licenseName"
]

{ #category : #'as yet unclassified' }
GtActionEcosystem >> removeRepo: aRepo [
	self repos remove: aRepo ifAbsent: [ ]
]

{ #category : #accessing }
GtActionEcosystem >> repos [
	^ repos ifNil: [ repos := OrderedCollection new ]
]

{ #category : #accessing }
GtActionEcosystem >> repos: aCollection [
	repos := aCollection
]
