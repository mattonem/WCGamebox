Class {
	#name : 'GBMouseClickPolygon',
	#superclass : 'GBMouseClickDetection',
	#traits : 'GBTPolygon',
	#classTraits : 'GBTPolygon classTrait',
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBMouseClickPolygon >> initialize [ 
	super initialize .
	self initializeGBTPolygon.
]
