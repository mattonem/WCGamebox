Class {
	#name : 'GBTransformationLookup',
	#superclass : 'GBAnnouncementUp',
	#instVars : [
		'transformation',
		'target'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBTransformationLookup >> initialize [

	super initialize.
	transformation := [ :point | point ].
	
]

{ #category : 'accessing' }
GBTransformationLookup >> target [

	^ target
]

{ #category : 'accessing' }
GBTransformationLookup >> target: anObject [

	target := anObject
]

{ #category : 'accessing' }
GBTransformationLookup >> transformation [

	^ transformation
]

{ #category : 'accessing' }
GBTransformationLookup >> transformation: anObject [

	transformation := anObject
]
