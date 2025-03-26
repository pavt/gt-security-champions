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
GtActionRepo >> contributors [
	^ self 
		createFrom: 'contributors_url'
		with: [ :data | GhContributors new rawData: data ] 
		onError: [ GhContributors new ]
]

{ #category : #'as yet unclassified' }
GtActionRepo >> gtContributorsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Contributors';
		priority: 30;
		stencil: [ | container imageContainer |
			container := BlElement new
					layout: BlFlowLayout new;
					constraintsDo: [ :c | 
						c vertical fitContent.
						c horizontal matchParent ].
			self contributors
				do: [ :each | 
					imageContainer := BrAsyncWidget new
							aptitude: BrShadowAptitude new
									+ (BrGlamorousButtonExteriorAptitude new
											backgroundPaint: Color white;
											borderPaint: Color transparent);
							background: Color white;
							margin: (BlInsets all: 10);
							constraintsDo: [ :c | 
								c vertical exact: 80.
								c horizontal exact: 180 ];
							stencil: [ each asCardElement	"margin: (BlInsets all: 20)" ].
					container addChild: imageContainer ].
			container asScrollableElement ]
]

{ #category : #'as yet unclassified' }
GtActionRepo >> gtDisplayOn: stream [
	stream nextPutAll: self actionName
]

{ #category : #'as yet unclassified' }
GtActionRepo >> gtReleasesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Releases';
		priority: 50;
		items: [ self releases ];
		column: 'Release' text: #tagName;
		column: 'Published at' text: #publishedAt;
		column: 'Created at' text: #createdAt
]

{ #category : #'as yet unclassified' }
GtActionRepo >> gtWebViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'WebView';
		stencil: [ GtWebViewElement new url: self htmlUrl ]
]

{ #category : #'as yet unclassified' }
GtActionRepo >> htmlUrl [
	^ rawData at: 'html_url'
]

{ #category : #'as yet unclassified' }
GtActionRepo >> releases [
	^ self 
		createFrom: 'releases_url'
		with: [ :data | GhReleases new rawData: data ] 
		onError: [ GhReleases new ]
]
