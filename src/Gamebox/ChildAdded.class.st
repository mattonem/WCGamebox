Class {
	#name : 'ChildAdded',
	#superclass : 'Announcement',
	#instVars : [
		'child'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
ChildAdded >> child: anObject [ 
	child := anObject
]
