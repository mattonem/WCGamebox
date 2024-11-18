Trait {
	#name : 'GBTPolygon',
	#instVars : [
		'points'
	],
	#traits : 'GBTGeometry',
	#classTraits : 'GBTGeometry classTrait',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBTPolygon >> contains: aPoint [
"http://www.philliplemons.com/posts/ray-casting-algorithm"
	| huge eps inside point |
	point := aPoint copy.
	huge := Float infinity.
	eps := 0.00001.
	inside := false.
	self edges do: [ :anEdge |
		| a b mEdge mPoint |
		(anEdge at: 1) y > (anEdge at: 2) y
			ifTrue: [
				a := anEdge at: 2.
				b := anEdge at: 1 ]
			ifFalse: [
				b := anEdge at: 2.
				a := anEdge at: 1 ].

		(point y = a y or: [ point y = b y ]) ifTrue: [
			point := point + (0 @ point y + eps) ].
		(point y > b y or: [ point y < a y or: [ point x > (a x max: b x) ] ])
			ifFalse: [
				point x < (a x max: b x)
					ifTrue: [ inside := inside not ]
					ifFalse: [
						[ mEdge := b y - a y / (b x - a x) ]
							on: ZeroDivide
							do: [ mEdge := huge ].

						[ mPoint := point y - a y / (point x - a x) ]
							on: ZeroDivide
							do: [ mPoint := huge ].
						mPoint >= mEdge ifTrue: [ inside := inside not ] ] ] ].

	^ inside
]

{ #category : 'accessing' }
GBTPolygon >> edges [

	| index edges |
	index := 1.
	edges := (points allButLast collect: [ :point |
		          | edge |
		          edge := {
			                  (points at: index).
			                  (points at: index + 1) }.
		          index := index + 1.
		          edge ]) asOrderedCollection.
	edges add: {
			points last.
			points first }.
	^ edges
]

{ #category : 'accessing' }
GBTPolygon >> initializeGBTPolygon [
	points := {  }
]

{ #category : 'accessing' }
GBTPolygon >> points [

	^ points
]

{ #category : 'accessing' }
GBTPolygon >> points: anObject [

	points := anObject copyWith: anObject first
]
