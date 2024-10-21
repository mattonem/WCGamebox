Class {
	#name : 'GBOchestrator',
	#superclass : 'GBElement',
	#instVars : [
		'listenTo',
		'sequence'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBOchestrator >> addedTo: aNode [

	aNode announcer 
		when: listenTo
		do: [:evt|
			sequence do: [ :anEvent |
				anEvent withTick: evt.
				aNode announcer announce: anEvent ] ]
		for: self
]

{ #category : 'as yet unclassified' }
GBOchestrator >> initialize [
	listenTo := GBTick.
	sequence := [  ]
]

{ #category : 'accessing' }
GBOchestrator >> listenTo: anObject [

	listenTo := anObject
]

{ #category : 'accessing' }
GBOchestrator >> sequence: anObject [

	sequence := anObject
]
