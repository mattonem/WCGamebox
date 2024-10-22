Class {
	#name : 'GBClock',
	#superclass : 'GBElement',
	#instVars : [
		'parent',
		'started',
		'lastUpdate',
		'requestedPeriodMs',
		'lastPeriod',
		'timeFactor',
		'timeoutId',
		'startedAt'
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
	lastPeriod := 1.
	self requestedTps: 60.
	timeFactor := 1.
	
]

{ #category : 'as yet unclassified' }
GBClock >> lastPeriod [

	^ lastPeriod
]

{ #category : 'as yet unclassified' }
GBClock >> loop [

	| dt loopStartTime nextUpdateDue |
	loopStartTime := self timeNow.
	window clearTimeout: timeoutId.
	lastPeriod := loopStartTime - lastUpdate + 1.
	started ifFalse: [ ^ self ].
	self tick.
	nextUpdateDue := loopStartTime + requestedPeriodMs.
	lastUpdate := loopStartTime.
	dt := nextUpdateDue - self timeNow.
	timeoutId := window setTimeout: [ self loop ] and: dt
]

{ #category : 'as yet unclassified' }
GBClock >> requestedTps: anInteger [

	requestedPeriodMs := 1 / anInteger * 1000
]

{ #category : 'as yet unclassified' }
GBClock >> start [
	started := true.
	lastUpdate := self timeNow.
	startedAt := lastUpdate.
	self loop. 
]

{ #category : 'as yet unclassified' }
GBClock >> startedAt [
	^ startedAt
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
			 duration: timeFactor * dt / requestedPeriodMs;
			 clock: self;
			 yourself)
]

{ #category : 'as yet unclassified' }
GBClock >> timeFactor: anInteger [
	timeFactor := anInteger 
]

{ #category : 'as yet unclassified' }
GBClock >> timeNow [

 ^ (window performance now) 
]

{ #category : 'as yet unclassified' }
GBClock >> tps [

	^ 1000 / lastPeriod
]
