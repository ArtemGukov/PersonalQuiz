//
//  Question.swift
//  PersonalQuiz
//
//  Created by Артем on 14/03/2019.
//  Copyright © 2019 Gukov.space. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponceType
    var answers: [Answer]
    
    static func loadData() -> [Question] {
        return [
            Question(text: "Итак, вы решили поехать за рубеж с минимальным бюджетом. Когда начнете планировать путешествие?",
                     type: .multiplay,
                     answers: [
                        Answer(text: "За полгода", type: .master),
                        Answer(text: "За месяц или раньше", type: .high),
                        Answer(text: "За пару дней перед поездкой", type: .normal),
                        Answer(text: "Зачем планировать? Поехали уже", type: .small)
                        ]
            ),
            Question(text: "Слушай, а минимальный бюджет это какой?",
                     type: .ranged,
                     answers: [
                        Answer(text: "25 000 руб.", type: .master),
                        Answer(text: "60 000 руб.", type: .high),
                        Answer(text: "130 000 руб.", type: .normal),
                        Answer(text: "300 000 руб.", type: .small)
                ]
            ),
            Question(text: "Где возьмете деньги на поездку?",
                     type: .single,
                     answers: [
                        Answer(text: "Буду голодать — вот и скоплю денег", type: .normal),
                        Answer(text: "Заведу накопительный счет и буду скидывать туда 10% от зарплаты", type: .high),
                        Answer(text: "Денег нет. Вся надежда на лотерею или блэк-джек", type: .small),
                        Answer(text: "Заведу кредитную карту с милями авиакомпаний", type: .master)
                ]
            ),
            Question(text: "Как потратите ваш скромный бюджет путешествия?",
                     type: .multiplay,
                     answers: [
                        Answer(text: "Забронирую всё сразу: билеты, отели, экскурсии", type: .small),
                        Answer(text: "Авиабилеты куплю заранее по кредитке, погашу все в грейс!", type: .master),
                        Answer(text: "Отель оплачу при заселении — будет время подкопить", type: .high),
                        Answer(text: "Куплю все на месте. 21 век на дворе", type: .small)
                ]
            ),
            Question(text: "На чём полетите?",
                     type: .single,
                     answers: [
                        Answer(text: "Предпочитаю родной «Аэрофлот». Государственный перевозчик!", type: .small),
                        Answer(text: "Помучаюсь на лоукостерах", type: .master),
                        Answer(text: "Боюсь летать", type: .small),
                        Answer(text: "Буду ждать Black Friday", type: .normal)
                ]
            ),
            Question(text: "Как снять жилье подешевле?",
                     type: .single,
                     answers: [
                        Answer(text: "Скамеек много в городе", type: .small),
                        Answer(text: "Приеду и попрошу таксиста отвезти меня в отель", type: .small),
                        Answer(text: "Поищу посуточную аренду квартир в социальных сетях", type: .master),
                        Answer(text: "Я живу только в четырех звездах - люблю комфорт и чистоту!", type: .normal)
                ]
            ),
            Question(text: "Окей, приехали и заселились. Как сэкономить на развлечениях?",
                     type: .multiplay,
                     answers: [
                        Answer(text: "Поищу недорогие музеи и выставки на «Форсквере»", type: .normal),
                        Answer(text: "Заведу ISIC, куплю проездной и билеты в музей со скидкой", type: .high),
                        Answer(text: "Попробую продать на рынке ненужное барахлишко", type: .normal),
                        Answer(text: "В путешествии впечатления важнее вещей!", type: .master)
                ]
            ),
            Question(text: "Что делать, если путешествовать хочется, а планировать всё самому — нет?",
                     type: .single,
                     answers: [
                        Answer(text: "Соберу компанию друзей и поеду с ними.", type: .high),
                        Answer(text: "Куплю горящую путевку на распродаже.", type: .high),
                        Answer(text: "Сидеть дома.", type: .small),
                        Answer(text: "Купить винишка.", type: .normal)
                ]
            )
        ]
    }
}

enum ResponceType {
    case single, multiplay, ranged
}
