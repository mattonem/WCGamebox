Class {
	#name : 'GBMouseClickCircle',
	#superclass : 'GBMouseClickDetection',
	#traits : 'GBTCircle',
	#classTraits : 'GBTCircle classTrait',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'comparing' }
GBMouseClickCircle >> initialize [ 
	super initialize .
	self initializeGBTCircle.
]
