class MichikusaController < ApplicationController
  def top
  end

  def index
    if params[:from_station] && params[:to_station]
      cookies[:from] = params[:from_station]
      cookies[:to] = params[:to_station]
    elsif !cookies[:from] && !cookies[:to]
      render 'top'
    end

    begin
      @from_station = Station.find_by(name: cookies[:from])
      @to_station = Station.find_by(name: cookies[:to])
      @between_stations = []
      calc_station_from_to
    rescue => e
      flash[:danger] = "入力された駅が存在しません"
      render 'top'
    end
  end

  def show
  end

  private
  ## TODO 可読性が低すぎる
  # 進行方向順になっている
  def calc_station_from_to
    id_array = (1..29).to_a
    from = @from_station.id
    to = @to_station.id
    between_stations = []

    if to > from
      if (to - from).abs < (29 - to + from).abs
        distances = (to - from).abs
        distances.times { |distance| @between_stations << Station.find(id_array[from + distance]) }
      else
        distances = (29 - to + from).abs
        distances.times { |distance| @between_stations << Station.find(id_array[from - distance - 2]) }
      end
    else
      if (from - to).abs < (29 - from + to).abs
        distances = (to - from).abs
        distances.times { |distance| @between_stations << Station.find(id_array[from - distance - 2]) }
      else
        from_to = from
        distances = (29 - from + to).abs
        distances.times do |distance|
        from_to = from_to + 1
        if from_to > 29
          from_to = 1
        end
        @between_stations << Station.find(id_array[from_to-1])
        end
      end
    end
  end
end
