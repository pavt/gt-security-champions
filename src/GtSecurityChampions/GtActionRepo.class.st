Class {
	#name : #GtActionRepo,
	#superclass : #GtActionEntity,
	#category : #'GtSecurityChampions-Model'
}

{ #category : #accessing }
GtActionRepo >> actionName [
	^ self rawData at: 'name'
]

{ #category : #'as yet unclassified' }
GtActionRepo >> gtDisplayOn: stream [
	stream nextPutAll: self actionName
]
