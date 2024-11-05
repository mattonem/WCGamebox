Class {
	#name : 'GBMouseClickDetection',
	#superclass : 'GBElement',
	#instVars : [
		'event'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBMouseClickDetection >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBMouseGlobalClick
		do: [ :ev |
			(self contains: ev position) ifTrue: [
				aNode announcer announce: (event with: ev position) ] ]
		for: self
]

{ #category : 'as yet unclassified' }
GBMouseClickDetection >> contains: aPoint [
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
GBMouseClickDetection >> initialize [

	super initialize.
	event := GBMouseElementClicked new
]
