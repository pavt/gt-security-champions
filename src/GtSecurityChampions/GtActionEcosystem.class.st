Class {
	#name : #GtActionEcosystem,
	#superclass : #GtActionObject,
	#instVars : [
		'repos'
	],
	#category : #'GtSecurityChampions-Model'
}

{ #category : #accessing }
GtActionEcosystem >> repos [
	^ repos
]

{ #category : #accessing }
GtActionEcosystem >> repos: anObject [
	repos := anObject
]
