-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 18 2022 г., 16:45
-- Версия сервера: 10.1.44-MariaDB
-- Версия PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `threejs`
--

-- --------------------------------------------------------

--
-- Структура таблицы `planner_layers`
--

CREATE TABLE `planner_layers` (
  `id` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `planner_layers`
--

INSERT INTO `planner_layers` (`id`, `alias`, `title`) VALUES
(1, 'layer1', 'Новый слой'),
(2, 'layer2', 'Электропроводники');

-- --------------------------------------------------------

--
-- Структура таблицы `planner_objects`
--

CREATE TABLE `planner_objects` (
  `id` int(11) NOT NULL COMMENT 'Идентификатор',
  `dateCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `dateUpdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата последнего редактирования',
  `groupId` int(11) NOT NULL COMMENT 'Идентификатор группы',
  `alias` varchar(100) NOT NULL COMMENT 'Кодовое обозначение',
  `caption` varchar(255) NOT NULL COMMENT 'Название',
  `caption_en` varchar(255) NOT NULL COMMENT 'Название на английском',
  `caption_es` varchar(255) NOT NULL COMMENT 'Название на испанском',
  `caption_fr` varchar(255) NOT NULL COMMENT 'Название на французском',
  `caption_ja` varchar(255) NOT NULL COMMENT 'Название на японском',
  `caption_ar` varchar(255) NOT NULL COMMENT 'Название на арабском',
  `caption_de` varchar(255) NOT NULL COMMENT 'Название на немецком',
  `caption_hi` varchar(255) NOT NULL COMMENT 'Название на хинди',
  `caption_ms` varchar(255) NOT NULL COMMENT 'Название на малайском',
  `caption_pt` varchar(255) NOT NULL COMMENT 'Название на португальском',
  `caption_he` varchar(255) NOT NULL COMMENT 'Название на иврите',
  `caption_zh` varchar(255) NOT NULL COMMENT 'Название на китайском',
  `productCode` varchar(255) DEFAULT NULL,
  `length` float NOT NULL COMMENT 'Длина, м',
  `lengthMin` float NOT NULL DEFAULT '0.1' COMMENT 'Минимальная длина',
  `lengthMax` float NOT NULL DEFAULT '100' COMMENT 'Максимальная длина',
  `width` float NOT NULL COMMENT 'Ширина, м',
  `widthMin` float NOT NULL DEFAULT '0.1' COMMENT 'Минимальная ширина',
  `widthMax` float NOT NULL DEFAULT '100' COMMENT 'Максимальная ширина',
  `height` float NOT NULL COMMENT 'Высота, м',
  `heightMin` float NOT NULL DEFAULT '0.1' COMMENT 'Минимальная высота',
  `heightMax` float NOT NULL DEFAULT '100' COMMENT 'Максимальная высота',
  `weight` float NOT NULL DEFAULT '0' COMMENT 'Вес, кг',
  `canPlaceId` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Место крепления: 1 - пол, 2 - стены, 3 - потолок',
  `placeRuleId` tinyint(4) DEFAULT NULL COMMENT 'Правило расположения: NULL - Нет правил, 1 - Прикрепить к полу',
  `light` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Не является источником света, 1 - Источник света',
  `showSizeInfo` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 - Не показывать размеры, 1 - Показывать размеры',
  `editSize` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Нельзя редактировать размеры, 1 - Можно редактировать размеры',
  `isHole` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Не создает дырку, 1 - Создает дырку (в полу, стене, потолку)',
  `animated` tinyint(1) NOT NULL COMMENT 'Наличие анимации',
  `hidden` tinyint(1) NOT NULL COMMENT 'Скрытие',
  `layers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Объекты';

--
-- Дамп данных таблицы `planner_objects`
--

INSERT INTO `planner_objects` (`id`, `dateCreate`, `dateUpdate`, `groupId`, `alias`, `caption`, `caption_en`, `caption_es`, `caption_fr`, `caption_ja`, `caption_ar`, `caption_de`, `caption_hi`, `caption_ms`, `caption_pt`, `caption_he`, `caption_zh`, `productCode`, `length`, `lengthMin`, `lengthMax`, `width`, `widthMin`, `widthMax`, `height`, `heightMin`, `heightMax`, `weight`, `canPlaceId`, `placeRuleId`, `light`, `showSizeInfo`, `editSize`, `isHole`, `animated`, `hidden`, `layers`) VALUES
(1, '2021-08-10 08:10:51', '2021-12-13 07:47:04', 60, 'straightSofa', 'Тканевый диван', 'Fabric sofa', 'Sofá de tela', 'Canapé en tissu', '布製ソファ', 'أريكة قماش', 'Sofa aus Stoff', 'कपड़ा सोफा', 'Sofa kain', 'Sofá de tecido', 'ספת בד', '布藝沙發', 'RG-000005', 1.43, 0.1, 100, 0.76, 0.1, 100, 0.65, 0.1, 100, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1),
(2, '2022-11-18 06:42:39', '0000-00-00 00:00:00', 60, 'car', 'asdf', 'asdf', 'asdf', 'asdf', 'sadf', 'adsf', 'adf', 'asdf', 'asdf', 'asdf', 'adsf', 'adf', '112', 123, 0.1, 100, 123, 0.1, 100, 312, 0.1, 100, 0, 1, NULL, 0, 1, 0, 0, 0, 0, 1),
(3, '2022-11-18 13:13:27', '0000-00-00 00:00:00', 60, 'martin', 'as', 'wqer', 'asdf', 'sadf', 'asdf', 'asdf', 'asdf', 'asdf', 'sdf', 'df', 'asdf', 'asdf', '123', 123, 0.1, 100, 1, 0.1, 100, 321, 0.1, 100, 0, 1, 1, 0, 1, 0, 0, 0, 0, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `planner_layers`
--
ALTER TABLE `planner_layers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `planner_objects`
--
ALTER TABLE `planner_objects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `planner_layers`
--
ALTER TABLE `planner_layers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `planner_objects`
--
ALTER TABLE `planner_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор', AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
