# frozen_string_literal: true

module Views
  module Schedules
    class Index < Views::Base
      def initialize(schedules:)
        super()

        @schedules = schedules
      end

      def view_template
        div(class: "w-screen h-screen p-2 flex flex-col items-center justify-center") do
          Card(class: "w-full max-w-lg") do
            CardHeader do
              CardTitle { "Selecione a melhor data" }
              CardDescription { "Por favor, escolha o melhor dia e hora para realizarmos nossa reunião" }
            end

            CardContent do
              div(class: "overflow-auto flex flex-row items-center justify-between gap-2") do
                form_with(id: "VIEWS__SCHEDULES__INDEX__FORM", url: schedules_path, class: "w-full flex flex-col gap-2") do
                  FormField do
                    6.times do |index|
                      date = Date.tomorrow + index

                      div(class: "space-y-0 flex flex-row flex-1 items-center justify-between gap-2") do
                        Text(size: "2") { date.strftime("%d/%m") }

                        %w[ 06:00 07:00 12:00 19:00 20:00 21:00 ].each_with_index do |hour, hour_index|
                          scheduled_at = "#{date} #{hour}"

                          if @schedules.exists?(scheduled_at:)
                            div(class: "relative h-9 my-0.5 flex flex-row items-center gap-2") do
                              RadioButton(disabled: true, class: "cursor-not-allowed w-14 h-8 flex-none border-zinc-300 rounded")
                              FormFieldLabel(class: "cursor-not-allowed absolute left-2 text-zinc-300") { hour }
                            end
                          else
                            div(class: "relative h-9 my-0.5 flex flex-row items-center gap-2") do
                              RadioButton(
                                required: true,
                                value: scheduled_at,
                                name: "schedule[scheduled_at]",
                                id: "datetime_#{index}_#{hour_index}",
                                data: { value_missing: "Campo obrigatório" },
                                class: [
                                  "w-14 h-8 flex-none border-zinc-300 rounded cursor-pointer peer",
                                  "focus:text-primary focus:ring-0",
                                  "hover:bg-primary hover:text-white",
                                  "checked:text-white checked:bg-primary"
                                ]
                              )

                              FormFieldLabel(
                                for: "datetime_#{index}_#{hour_index}",
                                class: [
                                  "absolute left-2 cursor-pointer",
                                  "peer-hover:bg-primary peer-hover:text-white",
                                  "peer-checked:text-white peer-checked:bg-primary"
                                ]
                              ) { hour }
                            end
                          end
                        end
                      end
                    end

                    FormFieldError()
                  end
                end
              end
            end

            CardFooter do
              Button(type: "submit", class: "w-full", form: "VIEWS__SCHEDULES__INDEX__FORM") do
                "Realize o pagamento para agendar a reunião"
              end
            end
          end
        end
      end
    end
  end
end
