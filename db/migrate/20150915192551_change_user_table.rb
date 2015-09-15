class ChangeUserTable < ActiveRecord::Migration
  def change
    change_column :users, :pic_url, :string, default: 'https://lh3.googleusercontent.com/-CSGikRvTw8k/SgL_L0G9BHI/AAAAAAABCyc/FuVvq_nfMK8/s200-Ic42/d_silhouette_horn_hand.jpg'
  end
end
