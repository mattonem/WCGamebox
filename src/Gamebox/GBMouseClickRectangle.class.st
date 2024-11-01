Class {
	#name : 'GBMouseClickRectangle',
	#superclass : 'GBMouseClickDetection',
	#traits : 'GBTRectangle',
	#classTraits : 'GBTRectangle classTrait',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'comparing' }
GBMouseClickRectangle >> initialize [ 
super initialize.
self initializeGBTRectangle 
]
