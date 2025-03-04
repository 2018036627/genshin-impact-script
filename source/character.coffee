import __albedo__ from '../../genshin-character-data/source/albedo.yaml'
import __aloy__ from '../../genshin-character-data/source/aloy.yaml'
import __amber__ from '../../genshin-character-data/source/amber.yaml'
import __arataki_itto__ from '../../genshin-character-data/source/arataki_itto.yaml'
import __barbara__ from '../../genshin-character-data/source/barbara.yaml'
import __beidou__ from '../../genshin-character-data/source/beidou.yaml'
import __bennett__ from '../../genshin-character-data/source/bennett.yaml'
import __chongyun__ from '../../genshin-character-data/source/chongyun.yaml'
import __diluc__ from '../../genshin-character-data/source/diluc.yaml'
import __diona__ from '../../genshin-character-data/source/diona.yaml'
import __eula__ from '../../genshin-character-data/source/eula.yaml'
import __fischl__ from '../../genshin-character-data/source/fischl.yaml'
import __ganyu__ from '../../genshin-character-data/source/ganyu.yaml'
import __gorou__ from '../../genshin-character-data/source/gorou.yaml'
import __hu_tao__ from '../../genshin-character-data/source/hu_tao.yaml'
import __jean__ from '../../genshin-character-data/source/jean.yaml'
import __kaedehara_kazuha__ from '../../genshin-character-data/source/kaedehara_kazuha.yaml'
import __kaeya__ from '../../genshin-character-data/source/kaeya.yaml'
import __kamisato_ayaka__ from '../../genshin-character-data/source/kamisato_ayaka.yaml'
import __keqing__ from '../../genshin-character-data/source/keqing.yaml'
import __klee__ from '../../genshin-character-data/source/klee.yaml'
import __kujou_sara__ from '../../genshin-character-data/source/kujou_sara.yaml'
import __lisa__ from '../../genshin-character-data/source/lisa.yaml'
import __mona__ from '../../genshin-character-data/source/mona.yaml'
import __ningguang__ from '../../genshin-character-data/source/ningguang.yaml'
import __noelle__ from '../../genshin-character-data/source/noelle.yaml'
import __qiqi__ from '../../genshin-character-data/source/qiqi.yaml'
import __raiden_shogun__ from '../../genshin-character-data/source/raiden_shogun.yaml'
import __rezor__ from '../../genshin-character-data/source/rezor.yaml'
import __rosaria__ from '../../genshin-character-data/source/rosaria.yaml'
import __sangonomiya_kokomi__ from '../../genshin-character-data/source/sangonomiya_kokomi.yaml'
import __sayu__ from '../../genshin-character-data/source/sayu.yaml'
import __shenhe__ from '../../genshin-character-data/source/shenhe.yaml'
import __sucrose__ from '../../genshin-character-data/source/sucrose.yaml'
import __tartaglia__ from '../../genshin-character-data/source/tartaglia.yaml'
import __thoma__ from '../../genshin-character-data/source/thoma.yaml'
import __traveler__ from '../../genshin-character-data/source/traveler.yaml'
import __venti__ from '../../genshin-character-data/source/venti.yaml'
import __xiangling__ from '../../genshin-character-data/source/xiangling.yaml'
import __xiao__ from '../../genshin-character-data/source/xiao.yaml'
import __xingqiu__ from '../../genshin-character-data/source/xingqiu.yaml'
import __xinyan__ from '../../genshin-character-data/source/xinyan.yaml'
import __yae_miko__ from '../../genshin-character-data/source/yae_miko.yaml'
import __yanfei__ from '../../genshin-character-data/source/yanfei.yaml'
import __yoimiya__ from '../../genshin-character-data/source/yoimiya.yaml'
import __yun_jin__ from '../../genshin-character-data/source/yun_jin.yaml'
import __zhongli__ from '../../genshin-character-data/source/zhongli.yaml'

# function
class Character

  data: {}

  # ---

  constructor: ->

    data = {}
    $.mixin data, albedo: __albedo__
    $.mixin data, aloy: __aloy__
    $.mixin data, amber: __amber__
    $.mixin data, arataki_itto: __arataki_itto__
    $.mixin data, barbara: __barbara__
    $.mixin data, beidou: __beidou__
    $.mixin data, bennett: __bennett__
    $.mixin data, chongyun: __chongyun__
    $.mixin data, diluc: __diluc__
    $.mixin data, diona: __diona__
    $.mixin data, eula: __eula__
    $.mixin data, fischl: __fischl__
    $.mixin data, ganyu: __ganyu__
    $.mixin data, gorou: __gorou__
    $.mixin data, hu_tao: __hu_tao__
    $.mixin data, jean: __jean__
    $.mixin data, kaedehara_kazuha: __kaedehara_kazuha__
    $.mixin data, kaeya: __kaeya__
    $.mixin data, kamisato_ayaka: __kamisato_ayaka__
    $.mixin data, keqing: __keqing__
    $.mixin data, klee: __klee__
    $.mixin data, kujou_sara: __kujou_sara__
    $.mixin data, lisa: __lisa__
    $.mixin data, mona: __mona__
    $.mixin data, ningguang: __ningguang__
    $.mixin data, noelle: __noelle__
    $.mixin data, qiqi: __qiqi__
    $.mixin data, raiden_shogun: __raiden_shogun__
    $.mixin data, rezor: __rezor__
    $.mixin data, rosaria: __rosaria__
    $.mixin data, sangonomiya_kokomi: __sangonomiya_kokomi__
    $.mixin data, sayu: __sayu__
    $.mixin data, shenhe: __shenhe__
    $.mixin data, sucrose: __sucrose__
    $.mixin data, tartaglia: __tartaglia__
    $.mixin data, thoma: __thoma__
    $.mixin data, traveler: __traveler__
    $.mixin data, venti: __venti__
    $.mixin data, xiangling: __xiangling__
    $.mixin data, xiao: __xiao__
    $.mixin data, xingqiu: __xingqiu__
    $.mixin data, xinyan: __xinyan__
    $.mixin data, yae_miko: __yae_miko__
    $.mixin data, yanfei: __yanfei__
    $.mixin data, yoimiya: __yoimiya__
    $.mixin data, yun_jin: __yun_jin__
    $.mixin data, zhongli: __zhongli__

    for key, char of data

      @data[key] =
        cdE: @padArray @makeValueIntoArray char['cd-e']
        cdQ: char['cd-q']
        color: @makeValueIntoArray char['color']
        durationE: @padArray @makeValueIntoArray char['duration-e']
        durationQ: char['duration-q']
        name: char['name']
        typeE: char['type-e']
        weapon: char.weapon

      @data[key].audio = @pickMulti key, 'audio'
      @data[key].onLongPress = @makeOnLongPress @pickMulti key, 'on-long-press'
      @data[key].onSwitch = @pickMulti key, 'on-switch'

  # padArray(list: [number] | [number, number]): [number, number]
  padArray: (list) ->
    if ($.length list) == 2 then return list
    $.push list, list[0]
    return list

  # pickMulti(key: string, name: string): string | undefined
  pickMulti: (key, name) ->

    value = Config.read "#{key}/#{name}", 0
    if value then return value

    value = Config.read "#{$.toLowerCase @data[key].name}/#{name}", 0
    return value

  # makeOnLongPress(value: string): string[] | undefined
  makeOnLongPress: (value) ->

    unless value then return 0

    value = $.replace value, ' ', ''
    listAll = []

    for group in $.split value, ';'
      listGroup = []
      for item in $.split group, ','
        $.push listGroup, item
      $.push listAll, listGroup

    return listAll

  # makeValueIntoArray: (value: number | number[]): number[]
  makeValueIntoArray: (value) -> switch $.type value
    when 'array' then return value
    when 'number' then return [value]
    else return [0]

# execute
Character = new Character()