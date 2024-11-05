Class {
	#name : 'GBTaskSequenceManager',
	#superclass : 'Object',
	#instVars : [
		'sequence',
		'inBetweenDo',
		'index',
		'element'
	],
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBTaskSequenceManager >> do [

	index = 1 ifFalse: [ ^ self ].
	element dispatchEvent: (Event new: 'progressEvent')
]

{ #category : 'accessing' }
GBTaskSequenceManager >> doNext [

	index > sequence size ifTrue: [
		index := 1.
		element dispatchEvent: (Event new: 'tasksFinished').
		^ self ].
	(sequence at: index) value.
	index := index + 1.
	inBetweenDo value.
	window
		setTimeout: [ element dispatchEvent: (Event new: 'progressEvent') ]
		in: 0
]

{ #category : 'accessing' }
GBTaskSequenceManager >> inBetweenDo [

	^ inBetweenDo
]

{ #category : 'accessing' }
GBTaskSequenceManager >> inBetweenDo: anObject [

	inBetweenDo := anObject
]

{ #category : 'accessing' }
GBTaskSequenceManager >> initialize [

	super initialize.
	index := 1.
	element := document createElement: 'null'.
	element addEventListener: 'progressEvent' block: [ self doNext ].
	inBetweenDo := [  ]
]

{ #category : 'accessing' }
GBTaskSequenceManager >> onFinishDo: aBlock [

	element addEventListener: 'tasksFinished' block: aBlock
]

{ #category : 'accessing' }
GBTaskSequenceManager >> sequence [

	^ sequence
]

{ #category : 'accessing' }
GBTaskSequenceManager >> sequence: anObject [

	sequence := anObject
]
