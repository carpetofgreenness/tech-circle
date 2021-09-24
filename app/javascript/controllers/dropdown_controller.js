import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['button', 'menu']

  connect() {
    this._wrappedHandler = (event) => { this.closeIfOutside(event) }
    document.addEventListener('click', this._wrappedHandler)
  }

  disconnect() {
    document.removeEventListener('click', this._wrappedHandler)
  }

  toggle() {
    this.isVisible() ? this.close() : this.open()
  }

  closeIfOutside(event) {
    if (this.isVisible() && !this.element.contains(event.target)) {
      this.close()
    }
  }

  // Private

  close() {
    this.menuTarget.classList.add('transitioning', 'closing')

    setTimeout(() => {
      this.menuTarget.classList.remove('transitioning', 'closing')
      this.menuTarget.classList.add('hidden')
      this.data.set('visible', false)
      this.buttonTarget.setAttribute('aria-expanded', 'false')
    }, 100)
  }

  open() {
    window.requestAnimationFrame(() => {
      this.menuTarget.classList.add('transitioning')
      this.menuTarget.classList.remove('hidden')
      
      window.requestAnimationFrame(() => this.menuTarget.classList.remove('transitioning'))
    })

    this.data.set('visible', true)
    this.buttonTarget.setAttribute('aria-expanded', 'true')
  }

  isVisible() {
    return this.data.get('visible') === 'true'
  }
}
