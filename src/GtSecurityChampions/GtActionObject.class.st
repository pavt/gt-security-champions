Class {
	#name : #GtActionObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GtSecurityChampions-Model'
}

{ #category : #accessing }
GtActionObject >> rawData [
	^ rawData ifNil: [ Dictionary new ]
]

{ #category : #accessing }
GtActionObject >> rawData: anObject [
	rawData := anObject
]
