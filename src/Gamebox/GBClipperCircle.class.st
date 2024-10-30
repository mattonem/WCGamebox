Class {
	#name : 'GBClipperCircle',
	#superclass : 'GBDrawingReference',
	#traits : 'GBTCircle',
	#classTraits : 'GBTCircle classTrait',
	#instVars : [
		'center'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBClipperCircle >> center [

	^ center
]

{ #category : 'accessing' }
GBClipperCircle >> center: anObject [

	center := anObject
]

{ #category : 'comparing' }
GBClipperCircle >> drawChildren: ctx evt: evt [

	ctx save.
	ctx beginPath.
	ctx
		arc: center x
		and: center y
		radius: r
		start: 0
		end: 2 * Float pi.
	ctx clip.
	announcer announce: evt.
	ctx restore
]

{ #category : 'comparing' }
GBClipperCircle >> initialize [

	super initialize.
	self initializeGBTCircle.
	center := 0@0
]
