Class {
	#name : 'GBMouseOverRectangle',
	#superclass : 'GBMouseOverDetection',
	#traits : 'GBTRectangle',
	#classTraits : 'GBTRectangle classTrait',
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBMouseOverRectangle >> initialize [

	super initialize.
	self initializeGBTRectangle
]
