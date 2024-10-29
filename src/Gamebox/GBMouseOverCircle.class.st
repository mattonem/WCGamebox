Class {
	#name : 'GBMouseOverCircle',
	#superclass : 'GBMouseOverDetection',
	#traits : 'GBTCircle',
	#classTraits : 'GBTCircle classTrait',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'comparing' }
GBMouseOverCircle >> contains: aPoint [
	^ aPoint r <= r
]

{ #category : 'comparing' }
GBMouseOverCircle >> initialize [

	super initialize.
	self initializeGBTCircle.

]
