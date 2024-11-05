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
		'startedAt',
		'timeNow'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBClock >> _timeNow [

 ^ (window performance now) 
]

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
	timeNow := self _timeNow 
	
]

{ #category : 'as yet unclassified' }
GBClock >> lastPeriod [

	^ lastPeriod
]

{ #category : 'as yet unclassified' }
GBClock >> lastUpdate [
	^ lastUpdate
]

{ #category : 'as yet unclassified' }
GBClock >> loop [

	| dt loopStartTime nextUpdateDue |
	loopStartTime := self _timeNow.
	window clearTimeout: timeoutId.
	lastPeriod := loopStartTime - lastUpdate.
	started ifFalse: [ ^ self ].
	self tick.
	nextUpdateDue := loopStartTime + requestedPeriodMs.
	lastUpdate := loopStartTime.
	dt := nextUpdateDue - self _timeNow.
	timeoutId := window setTimeout: [ self loop ] and: dt
]

{ #category : 'as yet unclassified' }
GBClock >> requestedTps: anInteger [

	requestedPeriodMs := 1 / anInteger * 1000
]

{ #category : 'as yet unclassified' }
GBClock >> start [

	started ifTrue: [ ^ self ].
	started := true.
	lastUpdate := self _timeNow.
	startedAt := lastUpdate.
	timeNow := 0.
	self loop
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
	dt := timeFactor * (self _timeNow - lastUpdate) / 16.
	parent announcer announce: (GBTick new
			 duration: dt;
			 clock: self;
			 yourself).
	timeNow := timeNow + dt
]

{ #category : 'as yet unclassified' }
GBClock >> timeFactor: anInteger [
	timeFactor := anInteger 
]

{ #category : 'as yet unclassified' }
GBClock >> timeNow [

 ^ timeNow
]

{ #category : 'as yet unclassified' }
GBClock >> tps [

	^ 1000 / lastPeriod
]
