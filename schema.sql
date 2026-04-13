-- ==========================================
-- SUPABASE SCHEMA: portfolio_projects (ENGLISH EXPANSION)
-- ==========================================

-- ==========================================
-- gallery_photos — standalone photo gallery
-- ==========================================
CREATE TABLE IF NOT EXISTS public.gallery_photos (
    id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    url         TEXT NOT NULL,
    caption_ar  TEXT DEFAULT '',
    caption_en  TEXT DEFAULT '',
    sort_order  INTEGER DEFAULT 0,
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_gallery_sort ON public.gallery_photos (sort_order ASC, created_at DESC);


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
    sort_order INTEGER DEFAULT 0,
    featured BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Migration: add columns to existing table if not already present
ALTER TABLE public.portfolio_projects ADD COLUMN IF NOT EXISTS sort_order INTEGER DEFAULT 0;
ALTER TABLE public.portfolio_projects ADD COLUMN IF NOT EXISTS featured BOOLEAN DEFAULT true;
CREATE INDEX IF NOT EXISTS idx_portfolio_sort ON public.portfolio_projects (sort_order ASC, created_at DESC);

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
    'جلد طبيعي فاخر مقوى',
    'Reinforced Luxury Natural Leather',
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
    'جلد طبيعي مضاد للبكتيريا والبقع',
    'Anti-bacterial & Stain-Resistant Natural Leather',
    'تصنيع أرائك جلوس متصلة مريحة جداً وتتحمل انسكاب الطعام والمشروبات اليومي، مع الحفاظ على مظهر كلاسيكي فاخر.',
    'Crafting deeply comfortable, continuous banquette seating capable of surviving daily heavy food and beverage spills, while projecting a classic, incredibly majestic dining aesthetic.',
    'اخترنا جلود مميزة بتكنولوجيا Nano-coating التي لا تمتص السوائل، وزودنا المقاعد بطبقات إسفنج متعددة الكثافة للراحة لساعات طويلة.',
    'We sourced specific architectural leathers featuring hydrophobic Nano-coating to repel liquids. The cushions were padded with multi-density foam layering specifically calibrated for prolonged seating comfort.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/Embosslogoonworkfromtheside',
    '["https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather"]'
);


-- ==========================================
-- SUPABASE SCHEMA: expertise_services
-- ==========================================

CREATE TABLE IF NOT EXISTS public.expertise_services (
    id           UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    sort_order   INTEGER NOT NULL DEFAULT 0,
    title        TEXT NOT NULL,
    subtitle     TEXT NOT NULL,
    description  TEXT NOT NULL,
    title_ar     TEXT NOT NULL DEFAULT '',
    subtitle_ar  TEXT NOT NULL DEFAULT '',
    description_ar TEXT NOT NULL DEFAULT '',
    image_url    TEXT NOT NULL DEFAULT '',
    created_at   TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable Row Level Security (read-only publicly)
ALTER TABLE public.expertise_services ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read expertise_services"
  ON public.expertise_services
  FOR SELECT USING (true);

    -- Migration: add Arabic columns to existing table (safe to run on existing deployments)
    ALTER TABLE public.expertise_services
    ADD COLUMN IF NOT EXISTS title_ar       TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS subtitle_ar    TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS description_ar TEXT NOT NULL DEFAULT '';

    -- Seed Data — 6 core services (bilingual)
    INSERT INTO public.expertise_services
    (sort_order, title, subtitle, description, title_ar, subtitle_ar, description_ar, image_url)
    VALUES
    (
    1,
    'Hotel Upholstery', 'Five-Star Standards',
    'At Modern Art, we understand that hotel furnishings are the first introduction to your guests. We provide comprehensive upholstery services that meet global five-star specifications, utilizing luxury natural leathers capable of surviving heavy footfall while retaining an aura of pure prestige.',
    'تنجيد الفنادق', 'معايير خمس نجوم',
    'نحن ندرك أن أثاث الفندق هو أول ما يلمسه ضيفكم. نقدم خدمات تنجيد شاملة تلتزم بمعايير الخمس نجوم العالمية، باستخدام جلود طبيعية فاخرة تتحمل الاستخدام المكثف مع الحفاظ على هالة الفخامة الخالصة.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather'
    ),
    (
    2,
    'Luxury Automotive', 'Bespoke Interiors',
    'The interior luxury of your vehicle is just as vital as the power beneath its hood. We offer bespoke automotive interior tailoring utilizing imported architectural leathers, obsessing over the micro-precision of every stitch to grant you a hyper-premium driving experience.',
    'تنجيد السيارات الفاخرة', 'داخليات مخصصة',
    'فخامة داخلية سيارتك بنفس أهمية قوة محركها. نقدم تنجيداً مخصصاً لمقاعد السيارات الفاخرة بجلود معمارية مستوردة، مع دقة متناهية في كل غرزة لمنحك تجربة قيادة استثنائية.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather'
    ),
    (
    3,
    'Classic Restoration', 'Revive The Legacy',
    'Antique classics carry priceless memories and heritage. Our master artisans possess the passion required to resurrect these pieces with extraordinary care, reinforcing internal framing and reupholstering with peak material selections to preserve the authentic visual soul.',
    'ترميم الكلاسيكيات', 'أحيِ الإرث',
    'التحف الكلاسيكية تحمل ذكريات لا تقدر بثمن. يمتلك أسطواتنا الشغف اللازم لإعادة إحياء هذه القطع بعناية فائقة، مع تعزيز الهيكل الداخلي وإعادة التنجيد بأجود الخامات للحفاظ على الروح الجمالية الأصيلة.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather'
    ),
    (
    4,
    'Bespoke Design', 'Made To Measure',
    'Do you have an exceptional vision? We manifest ideas into magnificent reality. From private royal lounges to VIP suites, we conceptualize and build entirely distinct leather solutions tailored to project your brand''s unique identity.',
    'تصميم مخصص', 'مصنوع على قياسك',
    'هل لديك رؤية استثنائية؟ نحن نحول الأفكار إلى واقع رائع. من المجالس الملكية الخاصة إلى أجنحة VIP، نبتكر ونبني حلولاً جلدية فريدة تعكس هوية علامتك التجارية بدقة.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather'
    ),
    (
    5,
    'Leather Wall Panels', 'Architectural Warmth',
    'Elevate your venue''s architectural grace through magnificent leather wall cladding. Paneling spaces in authentic leather casts an immediate aura of unadulterated luxury, serving as the ultimate backdrop for boardrooms, home theaters, and hotel suites.',
    'بانلات جلد للجدران', 'دفء معماري',
    'ارفع من أناقة مكانك من خلال تكسية الجدران بالجلد الطبيعي الرائع. يمنح الجلد الأصيل أجواءً من الفخامة الخالصة على الفور، ليكون الخلفية المثالية لقاعات الاجتماعات وأجنحة الفنادق.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather'
    ),
    (
    6,
    'Contract Maintenance', 'Eternal Perfection',
    'Consistent care is the cardinal secret to preserving leather''s immaculate state. We deploy scheduled luxury maintenance contracts including deep pore cleansing, advanced hydration, scuff healing, and structural tuning to guarantee your leather appreciates over time.',
    'عقود الصيانة الدورية', 'كمال أبدي',
    'العناية المستمرة هي السر الأساسي للحفاظ على حالة الجلد المثالية. نوفر عقود صيانة دورية فاخرة تشمل تنظيف عميق للمسام، ترطيب متقدم، إصلاح الخدوش، وضبط هيكلي لضمان تحسّن جلودك مع الزمن.',
    'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather'
    );

-- ==========================================
-- SUPABASE SCHEMA: partner_logos
-- ==========================================

-- Clean up the accidental columns added to the existing "clients" table
ALTER TABLE public.clients 
  DROP COLUMN IF EXISTS name,
  DROP COLUMN IF EXISTS logo_url,
  DROP COLUMN IF EXISTS sort_order;

-- Create the new partner_logos table
CREATE TABLE IF NOT EXISTS public.partner_logos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    logo_url TEXT NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable Row Level Security (read-only publicly)
ALTER TABLE public.partner_logos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read partner_logos"
  ON public.partner_logos
  FOR SELECT USING (true);

-- Seed Data (Initial partners from the static HTML)
INSERT INTO public.partner_logos (sort_order, name, logo_url) VALUES 
  (1, 'Fairmont', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/fairmont'),
  (2, 'Conrad', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/conrad'),
  (3, 'Marriott', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/mariott'),
  (4, 'Renaissance', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/renaissnace'),
  (5, 'La Roche', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/laroche'),
  (6, 'Pizza Hut', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/pizzahut'),
  (7, 'Hanimex', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/hanimex'),
  (8, 'Cecil', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/cecil');


-- ==========================================
-- SUPABASE SCHEMA: site_settings
-- Run this in the Supabase SQL editor.
-- Stores global site configuration as key/value pairs.
-- ==========================================

CREATE TABLE IF NOT EXISTS public.site_settings (
    key   TEXT PRIMARY KEY,
    value TEXT NOT NULL,
    label TEXT NOT NULL DEFAULT '',          -- human-readable label for CMS
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable Row Level Security
ALTER TABLE public.site_settings ENABLE ROW LEVEL SECURITY;

-- Public read (the front-end fetches the video URL without auth)
CREATE POLICY "Public read site_settings"
  ON public.site_settings
  FOR SELECT USING (true);

-- Authenticated users (service role / admin) can update
CREATE POLICY "Auth update site_settings"
  ON public.site_settings
  FOR UPDATE USING (auth.role() = 'service_role');

-- Seed: default values
INSERT INTO public.site_settings (key, value, label) VALUES
  ('hero_video_url',  'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/HEROVID',              'Hero Background Video URL'),
  ('story_image_url', 'https://pub-caa62f1b5ec34522975fc2acc07b5053.r2.dev/goldenembossonleather', 'Our Story Section — Photo')
ON CONFLICT (key) DO NOTHING;
