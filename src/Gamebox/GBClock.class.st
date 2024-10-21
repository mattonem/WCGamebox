Class {
	#name : 'GBClock',
	#superclass : 'GBElement',
	#instVars : [
		'parent',
		'started',
		'lastUpdate',
		'requestedPeriodMs'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBClock >> addedTo: aNode [
	parent := aNode
]

{ #category : 'as yet unclassified' }
GBClock >> initialize [

	started := false.
	lastUpdate := 0.
	self requestedTps: 60.
	
]

{ #category : 'as yet unclassified' }
GBClock >> loop [

	| dt loopStartTime nextUpdateDue |
	loopStartTime := self timeNow.
	started ifFalse: [ ^ self ].
	self tick.
	nextUpdateDue := loopStartTime + requestedPeriodMs.
	lastUpdate := loopStartTime.
	dt := nextUpdateDue - self timeNow.
	console log: dt.
	window setTimeout: [ self loop ] and: dt 
]

{ #category : 'as yet unclassified' }
GBClock >> requestedTps: anInteger [

	requestedPeriodMs := 1 / anInteger * 1000
]

{ #category : 'as yet unclassified' }
GBClock >> start [
	started := true.
	lastUpdate := self timeNow.
	self loop. 
]

{ #category : 'as yet unclassified' }
GBClock >> stop [
	started := false
]

{ #category : 'as yet unclassified' }
GBClock >> tick [

	| dt |
	dt := self timeNow - lastUpdate.
	parent announcer announce: (GBTick new
			 duration: dt/requestedPeriodMs;
			 yourself)
]

{ #category : 'as yet unclassified' }
GBClock >> timeNow [

 ^ (window performance now) asInteger
]
