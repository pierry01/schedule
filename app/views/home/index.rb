# frozen_string_literal: true

module Views
  module Home
    class Index < Views::Base
      def view_template
        div(class: "w-screen h-screen p-2 flex flex-col items-center justify-center") do
          Card(class: "w-full max-w-lg") do
            CardHeader do
              CardTitle { "Selecione a melhor data" }
              CardDescription { "Por favor, escolha o melhor dia e hora para realizarmos nossa reunião" }
            end

            CardContent do
              6.times do |index|
                div(class: "overflow-auto flex flex-row items-center justify-between gap-3") do
                  Text(size: "2") { (Date.tomorrow + index).strftime("%d/%m") }

                  form_with(id: "VIEWS__HOME__INDEX__FORM", url: "#", class: "flex flex-col gap-3") do
                    FormField(class: "space-y-0 flex flex-row flex-1 items-center justify-between gap-3") do
                      %w[ 06:00 07:00 12:00 19:00 20:00 21:00 ].each_with_index do |datetime, datetime_index|
                        div(class: "relative h-9 my-0.5 flex flex-row items-center gap-3") do
                          RadioButton(
                            required: true,
                            name: "datetime",
                            id: "datetime_#{index}_#{datetime_index}",
                            data: { value_missing: "Campo obrigatório" },
                            class: [
                              "w-14 h-8 flex-none border-zinc-300 rounded cursor-pointer peer",
                              "focus:text-primary focus:ring-0",
                              "hover:bg-primary hover:text-white",
                              "checked:text-white checked:bg-primary"
                            ]
                          )

                          FormFieldLabel(
                            for: "datetime_#{index}_#{datetime_index}",
                            class: [
                              "absolute left-2 cursor-pointer",
                              "peer-hover:bg-primary peer-hover:text-white",
                              "peer-checked:text-white peer-checked:bg-primary"
                            ]
                          ) { datetime }
                        end
                      end

                      FormFieldError()
                    end
                  end
                end
              end
            end

            CardFooter do
              Button(type: "submit", class: "w-full", form: "VIEWS__HOME__INDEX__FORM") do
                "Realize o pagamento para agendar a reunião"
              end
            end
          end
        end
      end
    end
  end
end
