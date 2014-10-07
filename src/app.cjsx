
React = require("react")

PIO.config
  # debug: true
  # required -- api 

  recipeId:"6cfb4f30-34c7-4cf6-9490-f51925650811"
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
          # images: ['http://share-fastly.picmonkey.com/prod/photo_posts/pBTLW2NVss3_11053460.jpg']
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
    </div>




React.renderComponent(
  <MyComponent />,
  document.getElementById('content')
  )
