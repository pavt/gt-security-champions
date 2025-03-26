Class {
	#name : #GtActionEcosystem,
	#superclass : #GtActionObject,
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
