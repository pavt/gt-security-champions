Class {
	#name : #GtActionEcosystem,
	#superclass : #GtActionObject,
	#instVars : [
		'repos'
	],
	#category : #'GtSecurityChampions-Model'
}

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
