Class {
	#name : 'GBLoadingBar',
	#superclass : 'GBPartialDrawing',
	#instVars : [
		'min',
		'max',
		'progress',
		'progressRect'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'adding' }
GBLoadingBar >> initialize [

	super initialize.
	min := 0.
	max := 100.
	progress := 0.
	self addElement: self loadBarFactory
]

{ #category : 'adding' }
GBLoadingBar >> loadBarFactory [

	| ref |
	ref := self translation: -55 @ 0.
	ref addElement: (GBRectangle new
			 color: '#9F9F9F';
			 corner: 110 @ 20;
			 yourself).
	(ref translation: 5 @ 5) addElement:
		(progressRect := GBRectangle new
			                 color: '#CCFF99';
			                 corner: self progressPx @ 10;
			                 yourself).
	^ ref
]

{ #category : 'accessing' }
GBLoadingBar >> max [

	^ max
]

{ #category : 'accessing' }
GBLoadingBar >> max: anObject [

	max := anObject
]

{ #category : 'accessing' }
GBLoadingBar >> min [

	^ min
]

{ #category : 'accessing' }
GBLoadingBar >> min: anObject [

	min := anObject
]

{ #category : 'accessing' }
GBLoadingBar >> progress [

	^ progress
]

{ #category : 'accessing' }
GBLoadingBar >> progress: anObject [

	progress := anObject.
	self updateProgressBar
]

{ #category : 'accessing' }
GBLoadingBar >> progressInc [

	self progress: progress + 1
]

{ #category : 'accessing' }
GBLoadingBar >> progressPx [

	^ progress - min / (max - min) * 100
]

{ #category : 'accessing' }
GBLoadingBar >> updateProgressBar [
	progressRect corner: (self progressPx @ 10).
	self needsUpdate 
]
