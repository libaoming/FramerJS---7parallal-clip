
Framer.Defaults.Animation = curve: 'spring(320,45,0)'

bg = new Layer
	image: 'images/1.jpg'
	width: Screen.width
	height: 650
	opacity: 0.65
bg.states.add {opaque:(opacity:0)}

scroll = new ScrollComponent
	scrollHorizontal: false
	width: Screen.width
	height: Screen.height

scroll.states.add {noScroll:(scroll:false)}

info = new Layer
	backgroundColor: 'white'
	width: Screen.width
	height: 2900
	y: bg.height - 100
	parent: scroll.content
	html:  "Good design (1.) is innovative – The possibilities for progression are not, by any means, exhausted. Technological development is always offering new opportunities for original designs. But imaginative design always develops in tandem with improving technology, and can never be an end in itself. (2.) Makes a product useful – A product is bought to be used. It has to satisfy not only functional, but also psychological and aesthetic criteria. Good design emphasizes the usefulness of a product whilst disregarding anything that could detract from it. (3.) Is aesthetic – The aesthetic quality of a product is integral to its usefulness because products are used every day and have an effect on people and their well-being. Only well-executed objects can be beautiful. (4.) Makes a product understandable – It clarifies the product’s structure. Better still, it can make the product clearly express its function by making use of the user's intuition. At best, it is self-explanatory. (5.) Is unobtrusive – Products fulfilling a purpose are like tools. They are neither decorative objects nor works of art. Their design should therefore be both neutral and restrained, to leave room for the user's self-expression. (6.) Is honest – It does not make a product appear more innovative, powerful or valuable than it really is. It does not attempt to manipulate the consumer with promises that cannot be kept. (7.) Is long-lasting – It avoids being fashionable and therefore never appears antiquated. Unlike fashionable design, it lasts many years – even in today's throwaway society. (8.) Is thorough down to the last detail – Nothing must be arbitrary or left to chance. Care and accuracy in the design process show respect towards the consumer. (9.) Is environmentally friendly – Design makes an important contribution to the preservation of the environment. It conserves resources and minimizes physical and visual pollution throughout the lifecycle of the product. (10.) Is as little design as possible – Less, but better – because it concentrates on the essential aspects, and the products are not burdened with non-essentials. Back to purity, back to simplicity."
	style: 
		'color':'black'
		'font-size':'2.1rem'
		'line-height':'3rem'
		'padding': '12rem 3rem 3rem'
		'font-family': 'futura'
		'font-weight':'300'
info.states.add {opaque:(opacity:0)}

circle = new Layer
	backgroundColor: 'white'
	size: 250
	borderRadius: '50%'
	parent: info
	x: Align.center
	y: -120
	shadowY: -5
	shadowBlur: 10
	

veryBG = new Layer
	width: Screen.width
	height: 500
	y: Screen.height - 500
	html: 'Dieter <br> Rams'
	opacity: 0
	style: 
		'font-size':'9rem'
		'color':'white'
		'padding-top':'11rem'
		'padding-left': '3rem'
		'line-height':'10rem'
		'font-family': 'futura'
		background: 'linear-gradient(180deg,white 0%,black 45%)'

veryBG.states.add {show:(opacity:1)}

scroll.on Events.Move, ->
	srcAmt = scroll.scrollY
	contentY = Utils.modulate(srcAmt,[0,3000],[0,-1200])
	
	if srcAmt < 0
		newScale = 1 - (srcAmt/350)
		bg.scale = newScale
	if srcAmt > 0
		bg.y = contentY


dieterMask = new Layer
	width: Screen.width
	height: Screen.width
	borderRadius: '50%'
	scale: 0.32
	parent: circle
	x: Align.center
	y: -250
	clip: true
	backgroundColor: null
	
dieterMask.states.add {full:(scale:2.2)}

dieter = new Layer
	image: 'images/dieter1.jpg'
	parent: dieterMask
	size: dieterMask.size
	
dieterMask.onClick ->
	yoffset = dieter.y  + scroll.scrollY/4
	
	dieter.animate {y: yoffset}
	dieterMask.states.next()
	bg.states.next()
	veryBG.states.next()