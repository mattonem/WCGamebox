Class {
	#name : 'GBClipperCircle',
	#superclass : 'GBNode',
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

{ #category : 'comparing' }
GBClipperCircle >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBFullDrawingNow
		do: [ :evt | self drawChildren: evt context evt: evt ]
		for: self.

]

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

{ #category : 'accessing' }
GBClipperCircle >> forwardEvent [

	^ super forwardEvent - GBFullDrawingNow  
]

{ #category : 'comparing' }
GBClipperCircle >> initialize [

	super initialize.
	self initializeGBTCircle.
	center := 0@0
]
