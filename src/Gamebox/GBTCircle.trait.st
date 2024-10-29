Trait {
	#name : 'GBTCircle',
	#instVars : [
		'r'
	],
	#traits : 'GBTGeometry',
	#classTraits : 'GBTGeometry classTrait',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'comparing' }
GBTCircle >> contains: aPoint [

	^ aPoint r <= r
]

{ #category : 'comparing' }
GBTCircle >> initializeGBTCircle [

	r := 0
]

{ #category : 'comparing' }
GBTCircle >> r: aRadius [
	r := aRadius
]
