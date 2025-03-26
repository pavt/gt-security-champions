Class {
	#name : #GtActionEntity,
	#superclass : #GtActionObject,
	#category : #'GtSecurityChampions-Model'
}

{ #category : #'as yet unclassified' }
GtActionEntity >> createFrom: aKey with: aBlock onError: anErrorBlock [
	^ rawData 
		at: aKey
		ifPresent: [ :url | 
			| trimmedUrl |
			trimmedUrl := url
				copyWithRegex: '{.*}'
				matchesTranslatedUsing: [ :each | ''].
			self httpClient 
				get: trimmedUrl
				onSuccess: [ :result | 
					[
						aBlock value: (STON fromString: result)
					] on: Error do: [ :e | anErrorBlock value ] ]
				onError: [ anErrorBlock value ] ]
		ifAbsent: [ {} ]
]

{ #category : #'as yet unclassified' }
GtActionEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Raw data';
		priority: 60;
		items: [ self rawData isDictionary 
			ifTrue: [ self rawData associations sorted: [:a :b | a key < b key ] ]
			ifFalse: [ self rawData ] ];
		column: 'Property' text: #key; 
		column: 'Value' text: #value;
		send: [ :each | 
			(each key endsWith: '_url')
				ifTrue: [ 
					self 
						createFrom: each key 
						with: [ :dictionary | 
							self propertyToClass 
								at: (each key withoutSuffix: '_url') 
								ifPresent: [ :aClass | aClass new rawData: dictionary ]
								ifAbsent: [ dictionary ]] 
						onError: [each value] ]
				ifFalse: [ each value ] ]
]

{ #category : #'as yet unclassified' }
GtActionEntity >> httpClient [
	^ ZnClient new
		setBearerAuthentication: GtGitHubTokenHolder token;
		yourself
]

{ #category : #'as yet unclassified' }
GtActionEntity >> propertyToClass [
	^ Dictionary new
]
