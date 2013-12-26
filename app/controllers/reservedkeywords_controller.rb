#coding: utf-8
class ReservedkeywordsController < ApplicationController
	def new
	end

	def create
		@reservedkeyword = Reservedkeyword.create(reservedkeyword_params)
		render "show"
	end

	def show
		unless @reservedkeyword = Reservedkeyword.where(id: 1).first
			render "new"
		end
	end

	def edit
		@reservedkeyword = Reservedkeyword.where(id: 1).first
	end

	def update
		@reservedkeyword = Reservedkeyword.find(1)
		@reservedkeyword.update_attributes(reservedkeyword_params)
		if @reservedkeyword.errors.empty?
			redirect_to reservedkeyword_path(1)
		else 
			flash.now[:error] = "Поле не может быть пустым!"
			render "edit"
		end
	end

	private

		def reservedkeyword_params
			params.require(:reservedkeyword).permit(:keywords)
		end 

end
