Class {
	#name : 'GBDebugger',
	#superclass : 'GBNode',
	#instVars : [
		'debugText',
		'lastPeriods',
		'lastUpdate'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'adding' }
GBDebugger >> addedTo: anElement [

	super addedTo: anElement.
	anElement announcer
		when: GBCalculate
		do: [
			| dt sum |
			dt := window performance now - lastUpdate.
			lastUpdate := window performance now.
			lastPeriods add: dt.

			lastPeriods := lastPeriods last: 10.
			sum := 0.
			lastPeriods do: [ :i | sum := sum + i ].

			sum = 0 ifFalse: [
				debugText text: 'fps: ' , (10000 / sum) asInteger ] ]
		for: self
]

{ #category : 'adding' }
GBDebugger >> debugFactory [

	| node |
	node := GBDrawingReference new position: 0 @ 48.
	debugText := GBText new.
	node addElement: debugText.
	^ node
]

{ #category : 'adding' }
GBDebugger >> initialize [

	super initialize.
	self addElement: self debugFactory.
	lastUpdate := window performance now.
	lastPeriods := { 0. 0. 0. 0. 0. 0. 0. 0. 0. 0 }
]
