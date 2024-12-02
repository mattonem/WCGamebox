"
A GBPolygonTest is a test class for testing the behavior of GBPolygon
"
Class {
	#name : 'GBPolygonTest',
	#superclass : 'TestCase',
	#category : 'Gamebox-Tests',
	#package : 'Gamebox-Tests'
}

{ #category : 'tests' }
GBPolygonTest >> testContains [

	| poly |
	poly := GBPolygon new points: {
			        (0 @ 0).
			        (0 @ 1).
			        (1 @ 1).
			        (1 @ 0) }.
	self assert: (poly contains: 3 @ 3) equals: false.
	self assert: (poly contains: 0.5 @ 0.5) equals: true.
	self assert: (poly contains: 0 @ 0) equals: false.

]

{ #category : 'tests' }
GBPolygonTest >> testEdges [

	| poly |
	poly := GBPolygon new points: {
			        (1 @ 1).
			        (2 @ 2).
			        (3 @ 0) }.
	self assert: poly edges size equals: 3.
	self assert: poly edges asSet equals: {
			{
				(1 @ 1).
				(2 @ 2) }.
			{
				(2 @ 2).
				(3 @ 0) }.
			{
				(3 @ 0).
				(1 @ 1) } } asSet
]
