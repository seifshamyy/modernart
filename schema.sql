-- ==========================================
-- SUPABASE SCHEMA: portfolio_projects (ENGLISH EXPANSION)
-- ==========================================

-- 1. Create the table
CREATE TABLE IF NOT EXISTS public.portfolio_projects (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    slug TEXT UNIQUE NOT NULL,
    title_ar TEXT NOT NULL,
    title_en TEXT NOT NULL,
    client TEXT,
    client_en TEXT,
    materials TEXT,
    materials_en TEXT,
    challenge TEXT,
    challenge_en TEXT,
    solution TEXT,
    solution_en TEXT,
    thumb TEXT NOT NULL,
    images JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Insert Dummy Data (With English Translations)
INSERT INTO public.portfolio_projects (
    slug, title_ar, title_en, client, client_en, materials, materials_en, challenge, challenge_en, solution, solution_en, thumb, images
) VALUES 
(
    'hotel-chair-emboss',
    'نقش على كرسي فندقي',
    'Hotel Chair Emboss',
    'فندق شيراتون القاهرة',
    'Sheraton Cairo Hotel',
    'جلد طبيعي إيطالي (Top Grain)',
    'Premium Italian Top Grain Leather',
    'كان التحدي يكمن في ابتكار نقش عميق وبارز لشعار الفندق على مسند الظهر دون إتلاف نسيج الجلد الطبيعي الحساس، وبحيث يتحمل الاستخدام التجاري المكثف للوبي الفندق.',
    'The challenge was to create a deep, prominent emboss of the hotel logo on the backrest without damaging the delicate natural leather grain, ensuring it withstands heavy commercial use in the bustling lobby.',
    'استخدمنا قوالب نحاسية مُصنّعة بالليزر وتقنية الكبس الحراري المدمج لضمان بروز الشعار بصورة فخمة ودائمة. تم معالجة الجلد بعد النقش بزيوت طبيعية لإعادة المرونة للنسيج.',
    'We engineered laser-cut brass molds and utilized integrated thermal pressing to guarantee a luxurious, permanent relief. The leather was subsequently treated with natural oils to restore strict flexibility.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Embosslogoonworkfromtheside',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Embosslogoonworkfromtheside", "https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather"]'
),
(
    'exhibition-booth',
    'جناح معرض',
    'Exhibition Booth',
    'معرض القاهرة الدولي',
    'Cairo International Exhibition',
    'جلد صناعي فاخر مقوى',
    'Reinforced Luxury Faux Leather',
    'تجهيز جناح عرض بمساحة ٥٠ متراً مربعاً وتكسية جميع جدرانه وحوامل العرض بالجلد خلال ٤٨ ساعة فقط ليتوافق مع موعد الافتتاح الرسمي.',
    'Outfitting a 50-square-meter exhibition booth by cladding all walls and display stands in leather within a strict 48-hour window before the official opening.',
    'تم تصنيع ألواح الجلد (Panels) مسبقاً في الورشة بأبعاد الجناح الدقيقة مع أنظمة تثبيت مخفية. اقتصر العمل في الموقع على التجميع الذي لم يستغرق سوى ١٢ ساعة لضمان الجودة العالية.',
    'Leather panels were pre-fabricated in our workshop to precise dimensions featuring hidden mounting systems. On-site labor was reduced to assembly, completing the flawless mastercraft in just 12 hours.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/booth',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/booth", "https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather"]'
),
(
    'vehicle-wrap',
    'تغليف سيارة العرض',
    'Vehicle Wrap',
    'مودرن آرت النقل الترويجي',
    'Modern Art Promotional Fleet',
    'فينيل مطفي وجلد كربوني',
    'Matte Vinyl & Carbon Leather Textures',
    'تحويل سيارة النقل التجارية إلى لوحة إعلانية متنقلة تعكس الفخامة والحرفية اليدوية للعلامة التجارية في شوارع القاهرة.',
    'Transforming a commercial transport vehicle into a moving billboard that instantly radiates the utmost luxury and handcrafted supremacy of the brand across Cairo.',
    'تصميم غلاف يدمج بين الملمس الجلدي الكلاسيكي (عن طريق الطباعة ثلاثية الأبعاد) والخطوط العصرية الذهبية، مما جعل السيارة تعبر عن القيمة دون كلمة واحدة.',
    'Designed a custom wrap blending a classic leather texture (via 3D tactile printing) with majestic golden lifelines, allowing the vehicle to communicate immense value without a single word.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/van',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/van"]'
),
(
    'workshop-signage',
    'لافتة الورشة',
    'Workshop Signage',
    'الورشة الرئيسية',
    'Modern Art Main Workshop',
    'جلد طبيعي مجدول ومعادن',
    'Braided Natural Leather & Iron',
    'تصميم لافتة تتحمل العوامل الجوية (الشمس والغبار) وتمثل في الوقت ذاته قلب الحرفة اليدوية التي يمارسها الأسطى بالداخل.',
    'Forging a signage system capable of withstanding harsh elemental exposure (sun and dust) while acting as the beating architectural heart and representative of the masterful craft practiced inside.',
    'تم شد جلد بقر خشن على إطار معدني مقاوم للصدأ، وكتابة الحروف بمعالجات كيميائية تزيد من تباين لون الجلد بمرور الزمن ليعطيه طابعاً عتيقاً (Patina).',
    'We stretched rugged cowhide over a rust-proof steel frame. The lettering was applied using chemical treatments that selectively burnish the leather, allowing it to develop a magnificent natural patina over time.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Workshopbanner',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Workshopbanner"]'
),
(
    'sample-packaging',
    'تغليف العينات',
    'Sample Packaging',
    'حملة التسويق للمهندسين',
    'Architects Marketing Campaign',
    'ورق مقوى فاخر وحقائب جلدية',
    'Premium Cardstock & Leather Briefs',
    'كيف نقدم عينات الجلود للمهندسين والمصممين بطريقة تشعرهم وكأنهم يستلمون هدية فاخرة، وليس مجرد مواد خام؟',
    'How do we present our swatches to elite architects and interior designers in a manner that feels like unboxing a bespoke luxury gift, rather than simply receiving raw material samples?',
    'ابتكرنا صناديق مخملية بغطاء مغناطيسي يضم مربعات الجلد المنسقة لونياً، مع حقيبة هدايا بمسكة جلدية مشغولة باليد تترك انطباعاً أولياً أقوى من أي كلمة.',
    'We conceptualized magnetic velvet closure boxes housing color-coordinated leather swatches. These are presented within a curated gift bag featuring a hand-stitched leather handle, guaranteeing a flawless first impression.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/packagingboxandbagforsamples',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/packagingboxandbagforsamples"]'
),
(
    'logo-on-leather',
    'الشعار على الجلد',
    'Logo on Leather',
    'عدة علامات تجارية',
    'Multiple Boutique Brands',
    'جلود طبيعية متنوعة',
    'Various Exotic & Natural Leathers',
    'حفر شعارات دقيقة ومعقدة على مساحات جلدية صغيرة دون حرق الحواف أو فقدان التفاصيل الدقيقة للتصميم.',
    'Precision engraving of highly intricate and complex logos onto miniature leather spaces without burning the edges or compromising the microscopic details of the design.',
    'تم استخدام تقنية الليزر البارد المُعدل (Cold Laser Engraving) الذي ينزع طبقة سطحية ميكرونية من الجلد، مظهراً اللون الداخلي الأصيل بتباين مذهل دون حرارة.',
    'We deployed modified Cold Laser Engraving techniques to strip away a micro-layer of the leather. This reveals the authentic inner dye with staggering contrast, completely bypassing thermal degradation.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Onleather',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Onleather", "https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather"]'
),
(
    'restaurant-seating',
    'تنجيد مطعم وكافيه',
    'Restaurant Seating',
    'مطعم ريڤيرا التجمع الأول',
    'Riviera Restaurant, New Cairo',
    'جلد صناعي مضاد للبكتيريا والبقع',
    'Anti-bacterial & Stain-Resistant Faux Leather',
    'تصنيع أرائك جلوس متصلة مريحة جداً وتتحمل انسكاب الطعام والمشروبات اليومي، مع الحفاظ على مظهر كلاسيكي فاخر.',
    'Crafting deeply comfortable, continuous banquette seating capable of surviving daily heavy food and beverage spills, while projecting a classic, incredibly majestic dining aesthetic.',
    'اخترنا جلود مميزة بتكنولوجيا Nano-coating التي لا تمتص السوائل، وزودنا المقاعد بطبقات إسفنج متعددة الكثافة للراحة لساعات طويلة.',
    'We sourced specific architectural leathers featuring hydrophobic Nano-coating to repel liquids. The cushions were padded with multi-density foam layering specifically calibrated for prolonged seating comfort.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Embosslogoonworkfromtheside',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather"]'
);
