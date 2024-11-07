Class {
	#name : 'GBOchestrator',
	#superclass : 'GBElement',
	#instVars : [
		'listenTo',
		'sequence',
		'manager'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBOchestrator >> addedTo: aNode [

	aNode announcer
		when: listenTo
		do: [ :evt |
			manager
				sequence: (sequence collect: [ :anEvent |
							 [
							 anEvent withTick: evt.
							 aNode announcer announce: anEvent ] ]);
				syncDo ]
		for: self
]

{ #category : 'as yet unclassified' }
GBOchestrator >> initialize [
	listenTo := GBTick.
	sequence := [  ].
	manager := GBTaskSequenceManager new.
]

{ #category : 'accessing' }
GBOchestrator >> listenTo: anObject [

	listenTo := anObject
]

{ #category : 'accessing' }
GBOchestrator >> manager [
	^ manager
]

{ #category : 'accessing' }
GBOchestrator >> sequence: anObject [

	sequence := anObject
]
