Class {
	#name : #BaselineOfGtSecurityChampions,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtSecurityChampions
}

{ #category : #loading }
BaselineOfGtSecurityChampions class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-security-champions' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtSecurityChampions >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtSecurityChampions'
		]
]
