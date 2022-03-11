import { Controller } from 'stimulus'
import TomSelect from 'tom-select'

export default class extends Controller {
  static get targets() {
    return ['filter']
  }

  static get values() {
    return {
      url: String,
      max: Number,
      plugins: Array
    }
  }

  connect() {
    let config = {
      plugins: (this.hasPluginsValue ? this.pluginsValue : ['clear_button']),
      valueField: 'value',
      maxItems: (this.hasMaxValue ? this.maxValue : 1)
    }

    if (this.hasUrlValue) {
      config.load = (q, callback) => this.fetchItems(q, callback)
    }

    const root = this.hasFilterTarget ? this.filterTarget : this.element

    this._tomSelect = new TomSelect(root, config)
  }

  // private

  fetchItems(q, callback) {
    Rails.ajax({
      type: 'get',
      url: this.urlValue,
      data: new URLSearchParams({ filter: q }).toString(),
      success: callback,
      error: console.log
    })
  }
}
