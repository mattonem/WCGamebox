Class {
	#name : 'GBDrawable',
	#superclass : 'GBElement',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'drawing' }
GBDrawable >> addedTo: aNode [

	aNode announcer
		when: GBADrawingNow 
		do: [ :evt | self drawOn: evt context ]
		for: self
]

{ #category : 'drawing' }
GBDrawable >> drawOn: aCanvas [
]
