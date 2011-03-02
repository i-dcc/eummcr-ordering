class SettingsController < ApplicationController
  def index
    @settings = {
      'product_type_price'    => {},
      'product_type_shipping' => {}
    }
    
    Settings.all.each do |setting|
      if setting.value =~ /^\{/
        @settings[setting.key] = JSON.parse(setting.value)
      else
        @settings[setting.key] = setting.value
      end
    end
    
    OrderedProductType.all.each do |product_type|
      @settings['product_type_price'][product_type.id] = product_type.price
      @settings['product_type_shipping'][product_type.id] = product_type.shipping
    end
    
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json   { render :json => @settings.to_json }
    end
  end

end
