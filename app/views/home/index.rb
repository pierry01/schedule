# frozen_string_literal: true

module Views
  module Home
    class Index < Views::Base
      def view_template
        div(class: "w-screen h-screen p-4 flex flex-col items-center justify-center") do
          Card(class: "w-full max-w-lg") do
            CardHeader do
              CardTitle { "Selecione a melhor data" }
              CardDescription { "Por favor, escolha o melhor dia e hora para realizarmos nossa aula" }
            end

            CardContent do
              div(class: "flex flex-col gap-2") do
                6.times do |index|
                  div(class: "flex flex-row items-center justify-between gap-2 overflow-auto") do
                    day = Date.tomorrow + index
                    Text(size: "2") { day.strftime("%d/%m") }

                    %w[ 06:00 07:00 12:00 19:00 20:00 21:00 ].each do |hour|
                      div(class: "border rounded cursor-pointer p-2") { Text(size: "2") { hour } }
                    end
                  end
                end
              end
            end

            CardFooter(class: "flex justify-end gap-x-2") do
              Button { "Agendar" }
              Button(variant: :outline) { "Cancelar" }
            end
          end
        end
      end
    end
  end
end
