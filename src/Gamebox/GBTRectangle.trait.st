Trait {
	#name : 'GBTRectangle',
	#instVars : [
		'corner'
	],
	#traits : 'GBTGeometry',
	#classTraits : 'GBTGeometry classTrait',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'comparing' }
GBTRectangle >> contains: aPoint [ 

	^ aPoint x > 0 and: [
		  aPoint y > 0 and: [
			  aPoint x < corner x and: [ aPoint y < corner y ] ] ]
]

{ #category : 'accessing' }
GBTRectangle >> corner [

	^ corner
]

{ #category : 'accessing' }
GBTRectangle >> corner: anObject [

	corner := anObject
]

{ #category : 'comparing' }
GBTRectangle >> initializeGBTRectangle [
	corner := 10@10
]
