
React = require("react")

PIO.config
  # debug: true
  # required -- api 

  recipeId:"c9e7d4b9-940f-4d29-a898-f7fcaa07c36e"
  # live
  url:"https://api.print.io/widget/"

  # optional
  # turn widget functionality on/off
  canUseUpload: false
  alwaysUseSingleTemplate:true
  canBuyOtherProducts: true

  style:
    # if you want the widget header turned off
    showHeader:false

    # optional
    # use your own css file hosted at the given URL
    # to override default widget styling
    cssUrl:'https://pconerly.github.io/printio-demo/static/override.css'

  fns:
    onEvent: (key, val) ->
      if key is 'section-init'
        # when a user navigates to a new page/section in the widget
        # you can later use val.tplName as the 'goTo' param in .open()
        # to direct the user back to that step
        console.log "the user is now looking at the #{val.tplName} template"
        console.log val
        if val.tplName is 'tpl-product-a'
          console.log "quit here"
          PIO.close()


  # ?
  # canBuyOtherProducts: true
  # canUseMap: true
  # goToCustomize: true
  # skipProductDetails:false


MyComponent = React.createClass

  openPrintIO: (e) ->
    PIO.open
      images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']

  openPrintIOshower: (e) ->
    console.log "shower!"
    PIO.open
      images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']

      # optional
      # predefined items
      #  an item should have the form
      #  { productId:0, sku:'', templateName:'', images:[] }
      # items: []
      items: [
        {
          productId: 89
          sku: 'ShowerCurtain_71x74'
          templateName: 'Single'
          # images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']
          quantity: 1
        }
      ]
      goTo: 'tpl-edit'
      # style:
      #   # if you want the widget header turned off
      #   showHeader:false

      #   # optional
      #   # use your own css file hosted at the given URL
      #   # to override default widget styling
      #   cssUrl:'https://gist.githubusercontent.com/pconerly/6deab5c7fb20675c9aa0/raw/2ee55784a3551d33972b5c1e410acf5314e18632/override.css'



  openPrintIOshowercart: (e) ->
    console.log "shower!"
    PIO.open
      images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']

      items: [
        {
          productId: 89
          sku: 'ShowerCurtain_71x74'
          templateName: 'Single'
          images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']
          quantity: 1
        }
      ]
      goTo: 'tpl-cart'

  embedded: (e) ->
    PIO.open
      images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']

      items: [
        {
          productId: 89
          sku: 'ShowerCurtain_71x74'
          templateName: 'Single'
          # images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']
          quantity: 1
        }
      ]
      goTo: 'tpl-edit'
      embedInElement:document.getElementById('embedHere')

  openCustomStep1: (e) ->
    PIO.open
      images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']

      items: [
        {
          productId: 43  # canvas wraps
          # sku: 'ShowerCurtain_71x74'
          # templateName: 'Single'
          # images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']
          # quantity: 1
        }
      ]
      # goTo: 'tpl-edit'
      goTo: 'tpl-product-b'

  openCustomStep2: (e) ->
    PIO.open
      images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']

      items: [
        {
          productId: 89  # shower curtain
          # sku: 'ShowerCurtain_71x74'
          # templateName: 'Single'
          # images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']
          # quantity: 1
        }
      ]
      # goTo: 'tpl-edit'
      goTo: 'tpl-product-b'

  clearCart: (e) ->
    'pass'
    PIO.clearCart()

  printCart: (e) ->
    console.log PIO.getCart()

  addtoCart: (e) ->
    PIO.open
      goTo: 'tpl-cart'
      images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']
      items: [ 
        { 
          # id: 'DA0F433C-D899-43E7-8227-34A7391641A7',
          images: [ 
            customizationState: {
              areas: [ 
                { 
                  height: 20129,
                  width: 26733.44269550653,

                  left: -8561,

                  parent: { 
                    height: 15400,
                    left: 0,
                    top: 0,
                    width: 14800
                  },
                  rotation: 0,
                  top: -1338.049543379979,
                  url: 'http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg',
                }
              ],
              backgroundColor: '#000000',
              isUserSet: false,
              orientation: 0
            }
          ],
          productId: 89,
          quantity: 1,
          sku: 'ShowerCurtain_71x74',
          templateName: 'Single'
        }
      ]

  addtoCart2: (e) ->
    PIO.open
      goTo: 'tpl-cart'
      images: ["http://scontent-a.cdninstagram.com/hphotos-xfa1/t51.2885-15/10616804_324389861072460_300407166_n.jpg"]
      items: [
        
        # for each item, there can be 1-many images
        
        # each image can be either a url
        # or a "customizationState"
        # which is a "representation of an image on a product"
        images: [
          customizationState:
            
            # an area is a "section" of an final image
            # -- there will be multiple areas
            # when you have a template with multiple spaces
            areas: [
              
              # height of the image placed
              height: 15399.999999999984
              width: 15399.999999999984
              
              # image was placed at -300,0
              #     inside the "parent box" (below)
              left: -299.9999999999813
              top: 0
              rotation: 0
              url: "http://scontent-a.cdninstagram.com/hphotos-xfa1/t51.2885-15/10616804_324389861072460_300407166_n.jpg"
              
              # parent is 
              # "where the image was placed"
              # -- think of the image being placed in a box
              parent:
                
                # the "parent box" had this height/width
                height: 15399.999999999984
                width: 14800.000000000022
                
                # the "parent box" started at 0,0
                left: 0
                top: 0
            ]
        ]
        productId: 89
        quantity: 1
        sku: "ShowerCurtain_71x74"
        templateName: "Single"
      ]



  render: ->
    <div>
      <span className="MyComponent">Hello, MyComponent!</span>
      <br/>
      <img src="http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg" />
      <br/>
      <button onClick={this.openPrintIO}>Print this photo</button>
      <button onClick={this.openPrintIOshower}>Print this photo as shower curtain</button>
      <button onClick={this.openPrintIOshowercart}>Print this photo as shower curtain, straight to cart</button>
      <button onClick={this.embedded}>Embedded</button>
      <br/>
      <button onClick={this.openCustomStep1}>Make a framed canvas, open at the first product selection step</button>
      <button onClick={this.openCustomStep2}>Make a shower curtain, open at the first product selection step</button>
      <br />
      <button onClick={this.clearCart}>Attempt to clear cart</button>
      <button onClick={this.printCart}>Print cart</button>
      <button onClick={this.addtoCart}>Add to cart w/ customization object</button>
      <button onClick={this.addtoCart2}>Add to cart -- Micahs example</button>
    </div>




React.renderComponent(
  <MyComponent />,
  document.getElementById('content')
  )
