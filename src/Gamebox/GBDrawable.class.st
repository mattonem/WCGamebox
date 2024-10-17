Class {
	#name : 'GBDrawable',
	#superclass : 'GBElement',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'drawing' }
GBDrawable >> addedTo: aNode [

	announcer
		when: GBDrawingNow 
		do: [ :evt | self drawOn: evt context ]
		for: self
]

{ #category : 'drawing' }
GBDrawable >> drawOn: aCanvas [
]
