Class {
	#name : 'GBElement',
	#superclass : 'Object',
	#instVars : [
		'name',
		'announcer'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBElement >> announcer [

	^ announcer 
]

{ #category : 'as yet unclassified' }
GBElement >> initialize [

	super initialize.
	announcer := Announcer new.
]

{ #category : 'as yet unclassified' }
GBElement >> name [
	^ name ifNil: [ name := self asString ] 
]

{ #category : 'as yet unclassified' }
GBElement >> name: aString [

	name := aString
]
