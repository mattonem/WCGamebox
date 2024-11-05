Class {
	#name : 'GBLoadManager',
	#superclass : 'Object',
	#instVars : [
		'task',
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
GBLoadManager >> do [ 
	element dispatchEvent: (Event new: 'progressEvent')
]

{ #category : 'accessing' }
GBLoadManager >> doNext [

	index >= task size ifTrue: [ ^ false ].
	(task at: index) value.
	index := index + 1.
	inBetweenDo value.
	window
		setTimeout: [ element dispatchEvent: (Event new: 'progressEvent') ]
		in: 0
]

{ #category : 'accessing' }
GBLoadManager >> inBetweenDo [

	^ inBetweenDo
]

{ #category : 'accessing' }
GBLoadManager >> inBetweenDo: anObject [

	inBetweenDo := anObject
]

{ #category : 'accessing' }
GBLoadManager >> initialize [

	super initialize.
	index := 1.
	element := document createElement: 'null'.
	element addEventListener: 'progressEvent' block: [ self doNext ]
]

{ #category : 'accessing' }
GBLoadManager >> task [

	^ task
]

{ #category : 'accessing' }
GBLoadManager >> task: anObject [

	task := anObject
]
