Extension { #name : #GtHome }

{ #category : #'*GtSecurityChampions' }
GtHome >> GtSecChampSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new
		title: 'Sec-Champ';
		description: 'Modeling Sec-Champs';
		databaseName: 'pavt/gt-security-champions/lepiter';
		startPageName: 'Gt-security-champions';
		priority: 8.
]
