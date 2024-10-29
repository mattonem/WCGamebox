Class {
	#name : 'GBMouseClickDetection',
	#superclass : 'GBElement',
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBMouseClickDetection >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBMouseClick
		do: [ :ev |
			(self contains: ev position) ifTrue: [
				aNode announcer announce:
					(GBMouseElementClicked new with: ev position) ] ]
		for: self
]

{ #category : 'as yet unclassified' }
GBMouseClickDetection >> contains: aPoint [
	self subclassResponsibility
]
