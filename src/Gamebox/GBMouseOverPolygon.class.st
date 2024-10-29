Class {
	#name : 'GBMouseOverPolygon',
	#superclass : 'GBMouseOverDetection',
	#traits : 'GBTPolygon',
	#classTraits : 'GBTPolygon classTrait',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBMouseOverPolygon >> initialize [

	super initialize.
	self initializeGBTPolygon
]
