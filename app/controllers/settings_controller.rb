class SettingsController < ApplicationController
  def index
    @settings = { 'product_type' => {} }
    
    Settings.all.each do |setting|
      if setting.value =~ /^\{/
        @settings[setting.key] = JSON.parse(setting.value)
      else
        @settings[setting.key] = setting.value
      end
    end
    
    OrderedProductType.all.each do |product_type|
      @settings['product_type'][product_type.id] = {
        :product_type => product_type.product_type,
        :price        => product_type.price,
        :shipping     => product_type.shipping,
        :clone_count  => product_type.clone_count
      }
    end
    
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json   { render :json => @settings.to_json }
    end
  end

end
