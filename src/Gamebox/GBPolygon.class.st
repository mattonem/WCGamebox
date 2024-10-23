Class {
	#name : 'GBPolygon',
	#superclass : 'GBDrawable',
	#instVars : [
		'points',
		'color'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBPolygon >> color [

	^ color
]

{ #category : 'accessing' }
GBPolygon >> color: anObject [

	color := anObject
]

{ #category : 'drawing' }
GBPolygon >> drawOn: ctx [

	ctx
		fillStyle: color;
		beginPath;
		moveTo: points first x and: points first y.
	points allButFirst do: [ :aPoint |
		ctx lineTo: aPoint x and: aPoint y ].
	ctx
	   moveTo: points first x and: points first y;
		closePath;
		fill
]

{ #category : 'accessing' }
GBPolygon >> edges [

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

{ #category : 'drawing' }
GBPolygon >> initialize [ 
	super initialize.
	points := OrderedCollection new.
	color := 'red'
]

{ #category : 'accessing' }
GBPolygon >> points [

	^ points
]

{ #category : 'accessing' }
GBPolygon >> points: anObject [

	points := anObject
]
